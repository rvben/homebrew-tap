class Esprite < Formula
  desc "Host-native ESP32/Arduino firmware simulator with an agent-facing CLI"
  homepage "https://github.com/rvben/esprite"
  version "0.3.0"
  license "MIT"

  on_macos do
    url "https://github.com/rvben/esprite/releases/download/v0.3.0/esprite-0.3.0-darwin-arm64.tar.gz"
    sha256 "7bdeccdee534d0b25db0ea1487c20661c8164e236246e81566d8b812e2d67cad"
  end

  on_linux do
    url "https://github.com/rvben/esprite/releases/download/v0.3.0/esprite-0.3.0-linux-x86_64.tar.gz"
    sha256 "30c23cefc85967fc71a14398e195608efaeb7f2eba48abaa1eb880dd0ce73eae"
  end

  def install
    bin.install "esprite"
  end

  test do
    assert_match "esprite", shell_output("#{bin}/esprite --version")
  end
end
