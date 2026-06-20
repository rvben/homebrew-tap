class Proxctl < Formula
  desc "CLI for Proxmox VE"
  homepage "https://github.com/rvben/proxctl"
  version "0.2.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.9/proxctl-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "b1aa85e44538e0ffcd61c2247d269111ef5c81a0cbfcb11b8995048ce6754ee9"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.9/proxctl-v0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "82d6f55d65c6547d0067373111268ae5b70dbe062fa0e06456fe513d4720277e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/proxctl/releases/download/v0.2.9/proxctl-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "abbcc41b338efd4bdd2581d2b4451df4ed651ef2e466ef4adc22412ce80439aa"
    else
      url "https://github.com/rvben/proxctl/releases/download/v0.2.9/proxctl-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7433e91001996e3268d97c059368ff595de026466fbe441dc3e127bc7093edf6"
    end
  end

  def install
    bin.install "proxctl"
  end

  test do
    system "#{bin}/proxctl", "--version"
  end
end
