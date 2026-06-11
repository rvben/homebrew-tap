class ZoomCli < Formula
  desc "CLI for Zoom"
  homepage "https://github.com/rvben/zoom-cli"
  version "0.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.5/zoom-cli-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "d750af239f716263650d5525763b10e9a46be0aff9159d8e6c330280df562fbc"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.5/zoom-cli-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "06d7fa9a11c055b125f6968a3ac9fdb995fb8eb002c07dff5ca5b6c973e573a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.5/zoom-cli-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "64bf4528af45e16ed61dd96123da85caf16475cd996f5db75fd19630ac604782"
    else
      url "https://github.com/rvben/zoom-cli/releases/download/v0.2.5/zoom-cli-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f2982248eef97a55841fd7eb6bcc31c3e446a8d699717979983bf63ce97a771"
    end
  end

  def install
    bin.install "zoom"
  end

  test do
    system "#{bin}/zoom", "--version"
  end
end
