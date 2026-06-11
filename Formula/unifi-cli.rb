class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.2/unifi-cli-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "0619ee1620ccbf8b677ac975ee7814e748c8bea477c1511834568792c3cde2bf"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.2/unifi-cli-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "506f288309a02c853f63f64eab941c5731c4efe9df65e95e96c5038a5e897678"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.2/unifi-cli-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64c39983ba582357c8bf4134f5c9097217f59c286658a1a10ddc530f00ece895"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.2.2/unifi-cli-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e12a823cee9a008e7e69c53e6f3ecc42999d71ebb403773416ccf678cfb6c507"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
