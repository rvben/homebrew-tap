class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.1"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.1/esprite-0.4.1-darwin-arm64.tar.gz"
    sha256 "8e0546dc017bb33332bbc60dbef77ee75ca6862e5acd1fe0050fa5f360c88c7c"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.1/esprite-0.4.1-linux-x86_64.tar.gz"
    sha256 "b330aef9eedde69f474f9a4a9bc61d79f5a71b00b5180eaade31526ef3e0921e"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
