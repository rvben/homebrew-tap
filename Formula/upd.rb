class Upd < Formula
  desc "Update dependencies across package ecosystems"
  homepage "https://github.com/rvben/upd"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.0/upd-v0.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "35180b2fe08323618c1e8a63f5cfe3cb19c05a38cabd7c550ee8bd82fc5009c4"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.0/upd-v0.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "606f78bc25d54f9c0831f6dc80129d3648440bfbdfd07d49c3e9ccd9f551521b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.0/upd-v0.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0ff84701f7b7e56e11ef8344ff641faf245c8fd29a1fc6e4476e5b52950edf7"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.0/upd-v0.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a2d09c5590a024b6da139bb92ee39b9509fb04ff2cdc0193b7c7cdd1a8baed6"
    end
  end

  def install
    bin.install "upd"
    bin.install_symlink "upd" => "upd-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/upd --version")
    assert_match version.to_s, shell_output("#{bin}/upd-cli --version")
    assert_match "Usage:", shell_output("#{bin}/upd --help")
  end
end
