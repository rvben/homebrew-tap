class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.4"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.4/esprite-0.4.4-darwin-arm64.tar.gz"
    sha256 "b98c7c5d23ba20df2cd002998de2be507184b320d0a88d16c32d304e0521efc2"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.4/esprite-0.4.4-linux-x86_64.tar.gz"
    sha256 "31c7499ffbd6346430e6e48078f761d7502eec315145e4c3287a9cdbddbfbdd5"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
