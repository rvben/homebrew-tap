class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.8/zoom-cli-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "396c630c2744b6010f6c4571c8fb1c6d956603cfdc976d70f145ea35af8d72bd"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.8/zoom-cli-v0.2.8-x86_64-apple-darwin.tar.gz"
      sha256 "cb5f415bbb99c5403e160b2fb0b13de621bf8c79ec5612d01a0b0b993f00977c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.8/zoom-cli-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b620251f5a5e8c1cb02b04967c44e68a341b4a288a4a80db88ab01fc4e98b30"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.8/zoom-cli-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f29a939f4a38c381a79691d126fcf8f3e16ccc971b64069a9207e116299551d"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
