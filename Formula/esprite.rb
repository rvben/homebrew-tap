class Esprite < Formula
  desc "Host-native ESP32/Arduino firmware simulator with an agent-facing CLI"
  homepage "https://github.com/rvben/esprite"
  version "0.2.0"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.2.0/esprite-0.2.0-darwin-arm64.tar.gz"
    sha256 "37623a8a32db04b3b3bd2701102bc9855f8855d239fd1e1f273434f7bf12da39"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.2.0/esprite-0.2.0-linux-x86_64.tar.gz"
    sha256 "15b6a1a7fb956a7377fea3374fdfe20f3ee89e260719de06c7e0378de6af827e"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
