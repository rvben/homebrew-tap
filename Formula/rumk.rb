class Rumk < Formula
  desc "Lint and format Makefiles"
  homepage "https://github.com/rvben/rumk"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/rumk/releases/download/v0.1.0/rumk-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1f1016018e46fca0d6c2b1cb260726d30f8ca7646c17e7fcb23e6a8811e0cc86"
    else
      url "https://github.com/rvben/rumk/releases/download/v0.1.0/rumk-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8e67569fa208155cc6543ff4c9b39770f40ec24341edce7a7ae121a9d92c96b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/rumk/releases/download/v0.1.0/rumk-0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ab6c4ed6264db9e31e4ba4b663c7799cff3bd0fd0acfef662c8faf4ded3ebdf"
    else
      url "https://github.com/rvben/rumk/releases/download/v0.1.0/rumk-0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88c53d6d3054718adbf7e72e6ef0046b6c80ef6b06b981e3386aed3fc86be321"
    end
  end

  def install
    bin.install "rumk"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rumk --version")
    (testpath/"Makefile").write ".PHONY: all\nall:\n\t@echo hello\n"
    system bin/"rumk", "check", "Makefile"
  end
end
