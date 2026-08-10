class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.3/unifi-cli-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "9ccaee4bf62851731b3a6dd4b16432cff6abf4e6bc82646aacfe894eab0f7b1e"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.3/unifi-cli-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "e8c7cbbb6310dc7cd2c90cabfdbaef285154088059e3361f55c2777ae30ca7c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.3/unifi-cli-v0.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6df3464317ef0b8455fbe43377a1a93f1804018cc5658fde413c96fab0709b9"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.3.3/unifi-cli-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "105ec304dc168695649c7c16a2ea1913187ae8b7c09a5b37c8893e58e327ba3c"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
