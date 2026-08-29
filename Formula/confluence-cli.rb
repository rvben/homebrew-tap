class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.26/confluence-cli-v0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "500fc192ff249011427659848e644fe3c63cbeff1b52183c0aa6af8e9becc845"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.26/confluence-cli-v0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "efbe3e96eaa660ae3042e8bb8ec95b824e139dc6b7e14c62f6dc9f960cfcfacd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.26/confluence-cli-v0.1.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31bf7ebd1ae41adb07fad9cdd6e1ce3323e4a791ea09c8db4c8871b4ec22bd34"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.26/confluence-cli-v0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb2be2621132fe38f5ab43e9c07c9dcee5630f216439fb10ae7883d8462bbc46"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
