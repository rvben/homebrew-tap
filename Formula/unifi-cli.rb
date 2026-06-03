class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.1/unifi-cli-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "1adb010c6846a1d8f90ea18dbeedf8dd2597399de1c1a04c28a6ebbcc56ad887"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.1/unifi-cli-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "0601d8b2df729dc93f714a752bdf063466d24fd9d408b4f014bc6a3a46e6f4e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.1/unifi-cli-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77f4d520076b4f9a1f67fdd8c4d4db3ef6207bbaa2e75e2febfb7d984720dc78"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.1/unifi-cli-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c293ef4b7fd67a857423b8fb7eff9b7a71abb9e353a4d8242fcc8375eef9bb07"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
