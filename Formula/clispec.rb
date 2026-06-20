class Clispec < Formula
  desc "Score CLI tools against The CLI Spec"
  homepage "https://github.com/rvben/clispec-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.4/clispec-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "0648abbe8db66196344bc5ea73fbca57861a60a8d1c6d8f80f7252b8658a0ed5"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.4/clispec-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "db02a51b252b5f9c7a03b369c7f10c17b0ea47be9ab936f6ed96ecc87759c41f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.4/clispec-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d97f815413247842ad6832667a89f29404d9b5f848195bf43a8c1441b7dce8b7"
    else
      url "https://github.com/rvben/clispec-cli/releases/download/v0.2.4/clispec-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3eb935aef8d880727b6193b7f446c45a727dbacc375cd8939ed4e4e9c928601d"
    end
  end

  def install
    bin.install "clispec"
  end

  test do
    system "#{bin}/clispec", "--version"
  end
end
