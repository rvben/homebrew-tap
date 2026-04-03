class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.6/proxctl-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "f510def98226148efa1d577f44a24ea63f26b29d3e052060fd556108fb4d2f8f"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.6/proxctl-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "93c99a98aa9442e09d5d75c200f6d704b4990db5d1d1b38e5589a8fb369940af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.6/proxctl-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4f24d478de59c76218f780fd45906f6426334ba21635a47d34982a94d81fc82"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.6/proxctl-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abf791327ae07fac6b99753a9dacaf07aea8ebf90b475abda3e416d126a6abbb"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
