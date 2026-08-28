class ConfluenceCli < Formula
  desc "Markdown-sync-first Confluence CLI in Rust"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.19/confluence-cli-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "94385f015c348a5f3ddf225f59158fab7d84e98af4b2baa4d8d6edf61b0a83e5"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.19/confluence-cli-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "86767f9c6976aeceafa535d330c70ee1604abcbd6a16aadd8a0a0c857627bc40"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/rvben/confluence-cli/releases/download/v0.1.19/confluence-cli-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b10f74942721e96d65edd060dc9de43c4f4f9c83f48df983613dddd597c63f78"
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
