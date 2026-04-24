class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.11/jira-cli-v0.3.11-aarch64-apple-darwin.tar.gz"
      sha256 "ec975bafc22e3f963b9ecd8d9f3d18aae28d89cf0407e0c4180907da279bc7d8"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.11/jira-cli-v0.3.11-x86_64-apple-darwin.tar.gz"
      sha256 "8d6a4bb7f3db60bbe6697548ef3b015f6f5a270f64dc1d2ff3a941aa5f4810fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.11/jira-cli-v0.3.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32e081025a9f3e5fb90b2209f4b0e3904c8ac6b6355f1af0faf874f941823a3f"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.11/jira-cli-v0.3.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ca8ad85430dd1c642be57b2b1c61c2b63a72449fe49c61afaa1f0c4e924b6ca"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
