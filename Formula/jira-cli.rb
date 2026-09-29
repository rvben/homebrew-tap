class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.18/jira-cli-v0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "bc60d805250423a5af7d342d87cf5b4edff7f82584448c2682c21387afb442ce"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.18/jira-cli-v0.4.18-x86_64-apple-darwin.tar.gz"
      sha256 "cec4cd047a0f57836d384fed0d94ef23c8881d8fe5b5ac2ec677923157b6ac07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.18/jira-cli-v0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2669d3526bd92495ea8f735127d5d1e2f4af62a77ac08d0a89d943c9134384cc"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.18/jira-cli-v0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "080f4cc262e9102dca0e6c2b414238f438fd3e23d2db4ecb039b8e4b62ff365c"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
