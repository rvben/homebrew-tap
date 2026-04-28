class JiraCli < Formula
  desc "CLI for Jira"
  homepage "https://github.com/rvben/jira-cli"
  version "0.3.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.12/jira-cli-v0.3.12-aarch64-apple-darwin.tar.gz"
      sha256 "5362306fe0c35dd9c54507504203d9be8ee43046c404f73038840cc03e779be3"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.12/jira-cli-v0.3.12-x86_64-apple-darwin.tar.gz"
      sha256 "01ee2f76e62e396d8134a6db8d2c692c3f5101001c0c7303cbc42fc432615fae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.12/jira-cli-v0.3.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47f76accb1b839f099d2e416c98792e661653ca0f3730cbb2be69c9b88513e02"
    else
      url "https://github.com/rvben/jira-cli/releases/download/v0.3.12/jira-cli-v0.3.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a10de9c78780a3f9da26fe07c984273c2db4557eb9733f39b80b369997db2a9"
    end
  end

  def install
    bin.install "jira"
  end

  test do
    system "#{bin}/jira", "--version"
  end
end
