class UnifiCli < Formula
  desc "CLI for UniFi Network controllers"
  homepage "https://github.com/rvben/unifi-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.2/unifi-cli-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "47720ae5c151e09bc4c5dd537e05a75a1de320004ca66159cb2058627cd2289f"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.2/unifi-cli-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "d2735368fc6b1f52ed80f3bb7ca57aee5823280a32e5ec8934f67c9de904ba20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.2/unifi-cli-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7122fce697279c346f592e08cdc63cfbc23887a888d752e2a9c92e79cba8f212"
    else
      url "https://github.com/rvben/unifi-cli/releases/download/v0.4.2/unifi-cli-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eec9220b36d90c59e29472480c13e5991a4cd29dfa836305cbf34d8e9dc2dd0e"
    end
  end

  def install
    bin.install "unifi"
  end

  test do
    system "#{bin}/unifi", "--version"
  end
end
