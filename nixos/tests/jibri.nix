import ./make-test-python.nix ({ pkgs, ... }: {
  name = "jibri";
  meta = with pkgs.lib; {
    maintainers = teams.jitsi.members;
  };

  nodes = {
    server = { config, pkgs, ... }: {
      virtualisation.memorySize = 5120;

      services.jitsi-meet = {
        enable = true;
        hostName = "server";
        jibri.enable = true;
      };
      services.jibri.ignoreCert = true;
      services.jitsi-videobridge.openFirewall = true;

      networking.firewall.allowedTCPPorts = [ 80 443 ];

      services.nginx.virtualHosts.server = {
        enableACME = true;
        forceSSL = true;
      };

      security.acme.email = "me@example.org";
      security.acme.acceptTerms = true;
      security.acme.server = "https://example.com"; # self-signed only
    };
  };

  testScript = ''
    server.wait_for_unit("jitsi-videobridge2.service")
    server.wait_for_unit("jicofo.service")
    server.wait_for_unit("nginx.service")
    server.wait_for_unit("prosody.service")
    server.wait_for_unit("jibri.service")

    server.wait_until_succeeds(
        "journalctl -b -u jitsi-videobridge2 -o cat | grep -q 'Performed a successful health check'"
    )
    server.wait_until_succeeds(
        "journalctl -b -u prosody -o cat | grep -q 'Authenticated as focus@auth.server'"
    )
    server.wait_until_succeeds(
        "journalctl -b -u prosody -o cat | grep -q 'Authenticated as jvb@auth.server'"
    )
    server.wait_until_succeeds(
        "journalctl -b -u prosody -o cat | grep -q 'Authenticated as jibri@auth.server'"
    )
    server.wait_until_succeeds(
        "cat /var/log/jitsi/jibri/log.0.txt | grep -q 'Joined MUC: jibribrewery@internal.server'"
    )

    assert '"busyStatus":"IDLE","health":{"healthStatus":"HEALTHY"' in server.succeed(
        "curl -X GET http://server:2222/jibri/api/v1.0/health"
    )
    server.succeed(
        """curl -H "Content-Type: application/json" -X POST http://localhost:2222/jibri/api/v1.0/startService -d '{"sessionId": "RecordTest","callParams":{"callUrlInfo":{"baseUrl": "https://server","callName": "TestCall"}},"callLoginParams":{"domain": "recorder.server", "username": "recorder", "password": "'"$(cat /var/lib/jitsi-meet/jibri-recorder-secret)"'" },"sinkType": "file"}'"""
    )
    server.succeed(
        "timeout 60 bash -c 'until cat /var/log/jitsi/jibri/log.0.txt | grep -q \"File recording service transitioning from state Starting up to Running\" ; do sleep 1; done;' "
    )
    server.succeed(
        """sleep 15 && curl -H "Content-Type: application/json" -X POST http://localhost:2222/jibri/api/v1.0/stopService -d '{"sessionId": "RecordTest","callParams":{"callUrlInfo":{"baseUrl": "https://server","callName": "TestCall"}},"callLoginParams":{"domain": "recorder.server", "username": "recorder", "password": "'"$(cat /var/lib/jitsi-meet/jibri-recorder-secret)"'" },"sinkType": "file"}'"""
    )
    server.succeed(
        "timeout 60 bash -c 'until cat /var/log/jitsi/jibri/log.0.txt | grep -q \"Recording finalize script finished with exit value 0\" ; do sleep 1; done;' "
    )
  '';
})
