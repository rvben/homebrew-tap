class ConfluenceCli < Formula
  desc "A CLI for reading, searching, syncing, and automating Confluence"
  homepage "https://github.com/rvben/confluence-cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.29/confluence-cli-v0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "a305ef7d3ee731d94200f5427ed344443bc69c162943ad04ded0e13b30de692f"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.29/confluence-cli-v0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "87d36ef02a4a2997ce050c7730cc001efec30fb18661dc4e327e8c64f853a49a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.29/confluence-cli-v0.1.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c91e3d6c47f4594dcb775c51395e3719fbd58bf78e9c035060e65d307981e1d0"
    end

    on_intel do
      url "https://github.com/rvben/confluence-cli/releases/download/v0.1.29/confluence-cli-v0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1aeab21067efb311d0f12d1d6380c1fe247a330050192db8f3495463966e0382"
    end
  end

  def install
    bin.install "confluence"
  end

  test do
    assert_match version, shell_output("#{bin}/confluence --version")
  end
end
