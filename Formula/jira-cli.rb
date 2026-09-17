class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.4.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.13/jira-cli-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "40fe84f6b02dbea9e8354cfcef543eb2da4da8c56e142ffbfbbc32c82ad8696d"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.13/jira-cli-v0.4.13-x86_64-apple-darwin.tar.gz"
      sha256 "3563426ee7415debfc89dc536d2bc50446c4dd4f0b2ed8fb502001e53c97fcda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.13/jira-cli-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65b2689db314e825afbfa0672aa7cbc41a07e4975b39c0ea791df78d135bbf20"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.4.13/jira-cli-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1bf84613afb38759bcbad122907eaf5cd21c5851b9a06b645a9e48df4540c35"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
