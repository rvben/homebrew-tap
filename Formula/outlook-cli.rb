class OutlookCli < Formula
  desc "Read and manage Outlook mail and calendars"
  homepage "https://github.com/rvben/outlook-cli"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.6/outlook-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "b2877b160fd245e6a175f2565f37f0a62f115f76943b25d4dfd442836b21f883"
    else
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.6/outlook-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "cdef1da7b74826f287001d83310366e8135bbc9b4e64278cc5541989a4dc132f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.6/outlook-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80bc030cfda4814edd85eff0a22b732c107b68d6b3a9a28f0404b258ec44f946"
    else
      url "https://github.com/rvben/outlook-cli/releases/download/v0.2.6/outlook-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "630efbe336113532a6ffd649097cfcf1c92f9c5f1eb8bff1f9741e0312680bfd"
    end
  end

  def install
    bin.install "outlook"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/outlook --version")
    assert_match "Usage:", shell_output("#{bin}/outlook --help")
  end
end
