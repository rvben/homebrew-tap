class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.24/confluence-cli-v0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "6b305d006e23ea9713c52ef89ce07b0154e694a470f52168b2b81eeaf635dc47"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.24/confluence-cli-v0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "a287b7e3d04403478ca318dadd5074db6247e426d972e2e67b3bf36efd556edc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.24/confluence-cli-v0.1.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1d15f4f8f346c8ac1dc15d1019391b6adfb89b5535e98b54ed7b1dc71bf192df"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.24/confluence-cli-v0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee33f8b09c04353df5571eb1324cc4f081d2263a7338e3673207610da778ef24"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
