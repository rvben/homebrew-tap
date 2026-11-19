class Upd < Formula
  desc "Update dependencies across package ecosystems"
  homepage "https://github.com/rvben/upd"
  version "0.18.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.7/upd-v0.18.7-aarch64-apple-darwin.tar.gz"
      sha256 "3b4cca84178cc5c29058629197779e19a75605a9bf07e8c8e34604de42a096fc"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.7/upd-v0.18.7-x86_64-apple-darwin.tar.gz"
      sha256 "5805f01da5522f6702c0a04874b03fe486428617e81efa437d6f7502accb8f5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.18.7/upd-v0.18.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ee25b1f7fa4970754b737a5d3cc9cd58d50b66350cb85cd5502e4ce91f7e448"
    else
      url "https://github.com/rvben/upd/releases/download/v0.18.7/upd-v0.18.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95e061a33c2961974812243366931700436f3aadf40ff210eb63aeb4b4dbe8b"
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
