class YukiCli < Formula
  desc "CLI for Yuki bookkeeping"
  homepage "https://github.com/rvben/yuki-cli"
  version "0.1.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.13/yuki-cli-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "69571bf65993e6ae6f9fd769d3ea9672c1c069a312a12468320c91756fef10f5"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.13/yuki-cli-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "36eb60d7c85defcc5e5280693bde6d9ff94af2343268bf3c415af64bf176ebb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.13/yuki-cli-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "797c9a251e567e92341df3db3fb56cf59233bed342b9a5a105769e7053ef48ca"
    else
      url "https://github.com/rvben/yuki-cli/releases/download/v0.1.13/yuki-cli-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e89dcc13e5f686eee1c652bf9b5f1bac1a1736f97c1d516c1d4195259d3b7cf1"
    end
  end

  def install
    bin.install "yuki"
  end

  test do
    system "#{bin}/yuki", "--version"
  end
end
