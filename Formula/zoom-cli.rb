class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.7/zoom-cli-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "e15b0e081284114e6e3e60c738820b385619c99f9738cd1bf1b8c931ce89ad5e"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.7/zoom-cli-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "5e08d27bae2d9dac51263681cee9bf92c24acafe62810e7eba6dea9e0dcba1d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.7/zoom-cli-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "896976978ebe855860e14bd5649640309b3c8d825c8b8f548af156455e7f08ae"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.7/zoom-cli-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81028aacc20944764651ce0ac4642d621a4d7010a6ea6ead17e22f4e55a7fbbd"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
