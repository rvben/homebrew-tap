class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.7/proxctl-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "aee96c34caea4ee5eaf43850b7a743397a2a7bef9d361e8753fee26f8895a5e1"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.7/proxctl-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "a7ee433bdee9151e9189e38ce2aa9a7ad680c64d36e1755273d7767bf7898ded"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.7/proxctl-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "767f0da37d373c857447be96db3885edaddd0531b71490541201f686a4b782ac"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.7/proxctl-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caf4ccd3d6e11bee4e83c3370d9ed7628b62dc9cbb14614dcab48cfbfc209abd"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
