class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.38/confluence-cli-v0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "825449975b1b801ac01e2b3570172ca25e483c08a8349930081a25985de25ecb"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.38/confluence-cli-v0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "a3a32a41899bf467c4e4e90d8f9d9e20398438ffcf73034b135381537cff309a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.38/confluence-cli-v0.1.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29c0945ba0f024d32131aa1892c33121b10692176ccb5710a584aec19cdd4137"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.38/confluence-cli-v0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "476cc32244abb02dbed9a3fb4f0e7dc35e4c1f1ea2db5dbe6728b98c785858ae"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
