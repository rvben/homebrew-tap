class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.27/confluence-cli-v0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "6e21f42790177955659d8c551b3da741e6d99ed5c76aa6399bbcb11e722ff660"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.27/confluence-cli-v0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "8647121282443bd3f1a6ec2891776d6afafc3856eb82fc948097fa3ae85d01ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.27/confluence-cli-v0.1.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2f7a5176a3776ac893f116e19a7a4a4dea0617ebfe0d8b14b5f05a24229858cf"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.27/confluence-cli-v0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3132194851076f37750e128cf05f6b418c794582a07c09e4f6a092665fa6cdea"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
