class Esprite < Formula
  desc "ESP32/Arduino firmware simulator with an agent-facing CLI (host-native + QEMU backends)"
  homepage "https://github.com/rvben/esprite"
  version "0.4.2"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.4.2/esprite-0.4.2-darwin-arm64.tar.gz"
    sha256 "e22539351f7ca64a0cf0bbdf936f284864092fa3d01f0d1a3dc011cae07824bb"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.4.2/esprite-0.4.2-linux-x86_64.tar.gz"
    sha256 "6c0029984712d96b191b7b02075f2dc869b34bed539298fcef9d74852713a2a0"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
