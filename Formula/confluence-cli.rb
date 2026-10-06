class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.36/confluence-cli-v0.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "c627ac4bc7d2da4206348fd7a33de058a391b0f224439811d7b6a7f6e453a3d9"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.36/confluence-cli-v0.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "e953135a40a02b88e5dff84460b6f2d5ec07999e92ab72b3ddbe97eaa64be8d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.36/confluence-cli-v0.1.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abc7ecd867a6c75c0e49cd3c8ace2d5a5aec9da5849f4490a2571e0a6ee9e633"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.36/confluence-cli-v0.1.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99f825e36dc47b153e03c18a2072cc73c2a7eb06c417e61c13082527e69b4352"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
