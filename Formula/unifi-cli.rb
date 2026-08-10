class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.1/unifi-cli-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "8396f8efc06fcd0d89a98abd1ed18c4195d28949e06b0b841e779c7636330675"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.1/unifi-cli-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "f5b6604f13254d20f3284a9d60f4e350ebcf1fa1d691106abcf3dfb7151cd77a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.1/unifi-cli-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a97be2608582d1e4f666d88fafe770c0865983777dd03b3d25710f30d0ae01c1"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.1/unifi-cli-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f18e94a6141efe665916edce6fbb69ff3700661476e90fc48a5b06ca4e72101"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
