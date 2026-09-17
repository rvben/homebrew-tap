class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.3/unifi-cli-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "59c8f88e16668171e53735d0ba9f9f8d0a25de49a458de24a8f9938f23baaa6a"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.3/unifi-cli-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "49d979c8200c9965e9f7d56cc30867b27e71022f958a86dde18ff80b690bb702"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.3/unifi-cli-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8050f80a04f4d13986533fbd606570dd9dd2d372a2cefde7726ef265dfc0c7eb"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.3/unifi-cli-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45f649e0f9783a6ea76f4ebfb5892d5d09d422c3f4c89a9937eb7361aa034469"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
