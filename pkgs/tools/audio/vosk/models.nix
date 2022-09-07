{ lib, fetchzip }:
lib.mapAttrs
  (model: config: fetchzip rec {
    name = "vosk-model-${config.lang}-${config.version}${config.lgraph}";
    url = "https://alphacephei.com/vosk/models/${name}.zip";
    inherit (config) sha256;
    meta = {
      inherit (config) license;
    };
  })
{
  # Regular models
  ar-mgb2 = {
    lang = "ar-mgb2";
    version = "0.4";
    lgraph = "";
    sha256 = "sha256-o4DuSLWf0sBj1qUf0wT1AUzT4nqFp4UdVn5a6pgIB0A=";
    license = lib.licenses.asl20;
  };
  small-ca = {
    lang = "small-ca";
    version = "0.4";
    lgraph = "";
    sha256 = "sha256-3pN+xE09nUHUSsCIK6iNsvjlNYvsz8XeWxHowmawJgU=";
    license = lib.licenses.asl20;
  };
  cn = {
    lang = "cn";
    version = "0.22";
    lgraph = "";
    sha256 = "shda256-dmc9MpjAQgCC/IyiBm/sAYwgzzsbGcJPJ0ZoJAbj740=";
    license = lib.licenses.asl20;
  };
  small-cs = {
    lang = "small-cs";
    version = "0.4-rhasspy";
    lgraph = "";
    sha256 = "sha256-z58e1gKT4vb0yhkhNVznY9iIn42p7i3rldZd8QVAd7A=";
    license = lib.licenses.mit;
  };
  de = {
    lang = "de";
    version = "0.21";
    lgraph = "";
    sha256 = "sha256-Pqf6Eo15aIfI3NYN1kYakUVyA6JD0hR2rW+R/2hDug4=";
    license = lib.licenses.asl20;
  };
  el-gr = {
    lang = "el-gr";
    version = "0.7";
    lgraph = "";
    sha256 = "sha256-XKavK46sX6r4GiXiYbs/+XbN+H8fAu/TC7tQE8d8NRQ=";
    license = lib.licenses.asl20;
  };
  en-in = {
    lang = "en-in";
    version = "0.5";
    lgraph = "";
    sha256 = "sha256-sE7NkBHP7sHRyyqPIkLxNuf2aZqNeNZVpSrBVYafWSU=";
    license = lib.licenses.asl20;
  };
  en-us = {
    lang = "en-us";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-kakOhA7hEtDM6WY3oAnb8xKZil9WTA3xePpLIxr2+yM=";
    license = lib.licenses.asl20;
  };
  small-en-us = {
    lang = "small-en-us";
    version = "0.15";
    lgraph = "";
    sha256 = "sha256-CIoPZ/krX+UW2w7c84W3oc1n4zc9BBS/fc8rVYUthuY=";
    license = lib.licenses.asl20;
  };
  en-us-lgraph = {
    lang = "en-us";
    version = "0.22";
    lgraph = "-lgraph";
    sha256 = "sha256-GVheflRwix9PnQjIVFl1mkNRduaYRNvZGhTZaobTibY=";
    license = lib.licenses.asl20;
  };
  small-eo = {
    lang = "small-eo";
    version = "0.42";
    lgraph = "";
    sha256 = "sha256-ZRbggC2TM9ynUPqzof/aPTVN3vlbcuZ2+trqBVsXKdQ=";
    license = lib.licenses.asl20;
  };
  small-es = {
    lang = "small-es";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-JRe3KTikkIq7kBV+YmxW6uc0dMRRclZAhhHOI3g9HBQ=";
    license = lib.licenses.asl20;
  };
  fa = {
    lang = "fa";
    version = "0.5";
    lgraph = "";
    sha256 = "sha256-yUTpPFtFdfZxm+Xh8KvyyCvjtl256nc8H2zQ0WCIFrc=";
    license = lib.licenses.asl20;
  };
  fr = {
    lang = "fr";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-PQYByIbw1pwGJnGODkpvlzy/7cLCQK3v+zAswj53jvA=";
    license = lib.licenses.asl20;
  };
  hi = {
    lang = "hi";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-KSH85TYuGBHAR4fU4KDXr44YHdP7lZV11iJ+fEiti6M=";
    license = lib.licenses.asl20;
  };
  it = {
    lang = "it";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-W8rg16lLQeAz6St8n3/kPdO7pbXQ1QSombF1Aq7tgIM=";
    license = lib.licenses.asl20;
  };
  ja = {
    lang = "ja";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-CjifemsTm6T2MnPgUOLhd7EsTqAc18N6MfhrhwBk06s=";
    license = lib.licenses.asl20;
  };
  kz = {
    lang = "kz";
    version = "0.15";
    lgraph = "";
    sha256 = "sha256-AcDUGa/o9709nC12Cv6+aKBDo4b9RU8oFJEwgoEyuzY=";
    license = lib.licenses.asl20;
  };
  small-nl = {
    lang = "small-nl";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-K71Zi75J7r3V6Q/uipWFywMbWIRElCbk5Nu8QN6zilE=";
    license = lib.licenses.asl20;
  };
  nl-spraakherkenning = {
    lang = "nl-spraakherkenning";
    version = "0.6";
    lgraph = "";
    sha256 = "sha256-BtyErVwrcUCbsGZmClWqYRytIfal05AjITzOcAIKLok=";
    license = lib.licenses.cc-by-nc-sa-40;
  };
  small-pl = {
    lang = "small-pl";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-ZiZZtbv5kbwqcIDEzaYwtJbRgmIA9Hjx86tBUk+CpPI=";
    license = lib.licenses.asl20;
  };
  small-pt = {
    lang = "small-pt";
    version = "0.3";
    lgraph = "";
    sha256 = "sha256-HG7tAQPkfMGGaGaCACIWapGHGsDAPBll5dtl7xi/AJc=";
    license = lib.licenses.asl20;
  };
  pt-fb = {
    lang = "pt-fb";
    version = "v0.1.1-20220516_2113";
    lgraph = "";
    sha256 = "sha256-35z/Df34SXl/a8LwfG4/sHiDXASCRuHcks3mJ0Zn8Yo=";
    license = lib.licenses.gpl3Only;
  };
  ru = {
    lang = "ru";
    version = "0.22";
    lgraph = "";
    sha256 = "sha256-vxe1YJpA5hI5L3ZhpGE3vFh1kTbRkcOrletaGWLnL5M=";
    license = lib.licenses.asl20;
  };
  small-sv-rhasspy = {
    lang = "small-sv-rhasspy";
    version = "0.15";
    lgraph = "";
    sha256 = "sha256-JVAGCkCOHbcDsfJDJqHaWEq3If9pI1gehWhLcLmdHN4=";
    license = lib.licenses.mit;
  };
  tl-ph-generic = {
    lang = "tl-ph-generic";
    version = "0.6";
    lgraph = "";
    sha256 = "sha256-c5k/dB+Kq9iAmz6UKY/cTqIwWK6uQ6qEjz7qAvvD4oo=";
    license = lib.licenses.cc-by-nc-sa-40;
  };
  small-tr = {
    lang = "small-tr";
    version = "0.3";
    lgraph = "";
    sha256 = "sha256-IOpQTgUbH5sFP9BQg9TbzJpeRrWPNy3UAQkSloVsKig=";
    license = lib.licenses.asl20;
  };
  uk = {
    lang = "uk";
    version = "v3";
    lgraph = "";
    sha256 = "sha256-uxocuXspb0ec7X6Ig3yUkJ4tDX2ytn10WKS78BYeoUE=";
    license = lib.licenses.asl20;
  };
  small-vn = {
    lang = "small-vn";
    version = "0.3";
    lgraph = "";
    sha256 = "sha256-6pX1B+BhhFDQ/hPtuIdKnujSWc0BNXJnEgohe7hpaUE=";
    license = lib.licenses.asl20;
  };

  # Speaker identification models
  spk = {
    lang = "spk";
    version = "0.4";
    lgraph = "";
    sha256 = "sha256-wpTfZnEL1sCfpLhp+l62d8GcOinR15XnSHaLVASH4RA=";
    license = lib.licenses.asl20;
  };
}
