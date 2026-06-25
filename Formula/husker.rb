class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.19/husker-v0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "9d092db208a2ae95b507276593957a85db9cea6673c9fcafd41688a3fc06d2c3"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.19/husker-v0.4.19-x86_64-apple-darwin.tar.gz"
      sha256 "bb43467f153944d09ed0861137be64c00c888ddd94dbec485f344af02dd8c3a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.19/husker-v0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a5721f7ea5eb8fc026ce74490476e1c24156649136bb1790f9ec1698009c63d"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.19/husker-v0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c20202cc4efce147d57b346091b5c32941ba5183c8b80fa58ee4b56085ccd60c"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
