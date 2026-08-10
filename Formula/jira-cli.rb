class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.16/jira-cli-v0.3.16-aarch64-apple-darwin.tar.gz"
      sha256 "9b11091231615b7eabae237581ccaaeca39d3fadb6de1a44009fc15981062f7e"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.16/jira-cli-v0.3.16-x86_64-apple-darwin.tar.gz"
      sha256 "1e66c4f56196f615d62040b1875b0049812812822cd70c31e278d6ae7edc80a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.16/jira-cli-v0.3.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f612f62e9091531e5357fc67d21ae2ff695c92ab58e4ca56a0c17918c610e0f"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.16/jira-cli-v0.3.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "02794e052e2d3ae42e7e5d56a8696ba46b6e2942299fe973277a935ae6289b83"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
