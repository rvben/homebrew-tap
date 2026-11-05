class Upd < Formula
  desc "Update dependencies across package ecosystems"
  homepage "https://github.com/rvben/upd"
  version "0.18.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.3/upd-v0.18.3-aarch64-apple-darwin.tar.gz"
      sha256 "612084d147366e34a79f25cbd44d1200faca4cc781a179a170c35827fa370173"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.3/upd-v0.18.3-x86_64-apple-darwin.tar.gz"
      sha256 "a068fc58df36d623ef93436b050c34fc63b31c7349bbc5d2c7970f1f7614533d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.3/upd-v0.18.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8ba88a7ca4e60056f00b08009cefe9b1ed7146ce3f9f3347a42b267b2a253c9"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.3/upd-v0.18.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e37b79dc4be07b9d82c8932e6d408a1786d1cb90ce6445d23fa50f8941954e1c"
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
