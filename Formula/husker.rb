class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.2/husker-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "211fad3d4bee8b8a21bcbffc382f0772ca9602a628b67083ecfd8fe439a01fc4"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.2/husker-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "1e68a07723d0e13fd0ad0ad48b3d88d81733b20b36fb07c45b9125f8edc8c523"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.3.2/husker-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "604d839226eb13e3f6ca21b4530e8b635ffb8d87a74d89a5e250b7df5758109c"
    else
      url "https://github.com/rvben/husker/releases/download/v0.3.2/husker-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d4148aca45303c06c7dbf513b705cf89cb9ae0ccf49e730f4792acd214730b5"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
