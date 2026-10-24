class Upd < Formula
  desc "Update dependencies across package ecosystems"
  homepage "https://github.com/rvben/upd"
  version "0.17.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.17.4/upd-v0.17.4-aarch64-apple-darwin.tar.gz"
      sha256 "40f3c6c443c41e9ddfcaa97438f4be0269b7443852317f97475baf7d0cfa5065"
    else
      url "https://github.com/rvben/upd/releases/download/v0.17.4/upd-v0.17.4-x86_64-apple-darwin.tar.gz"
      sha256 "ca238cff021e3b334a4a78a45011fd4abd008243b7dd6470727effa292ca3534"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/upd/releases/download/v0.17.4/upd-v0.17.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae152bb013e44efd1ad70db9c8bf03f4131af31883444608d8f9cef42920da22"
    else
      url "https://github.com/rvben/upd/releases/download/v0.17.4/upd-v0.17.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c23862ce3739bd478c9cf0ed57f3235494eef62ffac533cd5c119d2ae54788c0"
    end
  end

  def install
    bin.install "upd"
    bin.install_symlink "upd" => "upd-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/upd --version")
    assert_match version.to_s, shell_output("#{bin}/upd-cli --version")
    assert_match "Usage:", shell_output("#{bin}/upd --help")
  end
end
