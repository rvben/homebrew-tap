class Husker < Formula
  desc "MicroVM manager built on Firecracker (Linux) and Apple Virtualization.framework (macOS)"
  homepage "https://github.com/rvben/husker"
  version "0.4.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.24/husker-v0.4.24-aarch64-apple-darwin.tar.gz"
      sha256 "6384ef776373b566491827663b458e48ad41caab56a50f848b86015cf412c255"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.24/husker-v0.4.24-x86_64-apple-darwin.tar.gz"
      sha256 "e0ab97117d3f2d40a9c34d287d8fc02132467e1fcfc22d4b945ac51cc4c9a097"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/husker/releases/download/v0.4.24/husker-v0.4.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ed3e1dac7686ce74024a9a092c945cdc384b0e339a127d88568a7ceb010bbab"
    else
      url "https://github.com/rvben/husker/releases/download/v0.4.24/husker-v0.4.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6750c797aaefad25e48d8cdd9fed220a4ac4cd6398b6ad8b10ff5bd771c1c3f0"
    end
  end

  def install
    bin.install "husker"
  end

  test do
    system "#{bin}/husker", "--version"
  end
end
