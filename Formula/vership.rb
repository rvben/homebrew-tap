class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.1/vership-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "17a979dfc44e4ba91e9907020bf96a36142090525888eabcb5fc516022b650c3"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.1/vership-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "5068524214bbd3c929cf2d9d27d273d8de29b166f192eddd296710f744c992ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.1/vership-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "910490b13760aa4b3cf280c298c1d97952f0660aa9fdf44ad390d87fc1b511ea"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.1/vership-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ffb721559916429ebdc0feac349250ee4d62b86d3af4ea3331f2d8f978c135e"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
