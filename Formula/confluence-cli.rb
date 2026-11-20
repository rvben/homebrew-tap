class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.41/confluence-cli-v0.1.41-aarch64-apple-darwin.tar.gz"
      sha256 "52c6e0cea43fedf34b1d15a17e1f900b880124921dbbd037175b01f93a9b4249"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.41/confluence-cli-v0.1.41-x86_64-apple-darwin.tar.gz"
      sha256 "4b51176e35e9199acba42eafcff277a6fafd6c58d0642921ff816a2410220caa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.41/confluence-cli-v0.1.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c89acf2b2f25911a2cd4db1f5181f651d939401eba2250138ded5602ec6680e"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.41/confluence-cli-v0.1.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cc828153ea2986dc852d2efc38b72c305c02755fa4ce08b97314f039e8e68ae9"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
