class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.35/confluence-cli-v0.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "4c675313e63e74685c6ad81c89b47831c1ed47c9d303446c73a60f481f228254"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.35/confluence-cli-v0.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "8743ef452ca8c3cbe1dd26ba3f8a5d8d616c11243c15b244f427ff39c4fb2f61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.35/confluence-cli-v0.1.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48883f5b423e8adfec450e33cd36aade998a1a2a9c997007908bb444a98858b0"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.35/confluence-cli-v0.1.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bb6937754b4ee69beb3d3a1044026405b24225365bfef997b80e68746103bc6"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
