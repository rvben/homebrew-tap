class Upd < Formula
  desc "Update dependencies across package ecosystems"
  homepage "https://github.com/rvben/upd"
  version "0.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.1/upd-v0.18.1-aarch64-apple-darwin.tar.gz"
      sha256 "90883ec38b4f7d2b7209b6b2a304860641b7f8b79bfaba3e8040c5d57b225882"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.1/upd-v0.18.1-x86_64-apple-darwin.tar.gz"
      sha256 "104948ea4b8739a3a48491b4d3ad1aa307c1337595de801eaa6eb2e5f4e9eeec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.1/upd-v0.18.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b14691a68d694b7ff102d2e63c3ca01155f0ef9e79c00501800fbd1397abae6"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.1/upd-v0.18.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f8e5ce7e987cc3425d32a990195e8b0cdd65b8bfccff498647c504a0b8be892"
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
