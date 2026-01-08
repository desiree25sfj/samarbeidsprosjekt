## SOPS Sealed Secrets

> [!TIP]
>
> When approaching new CLI tools, remember that most will have some documentation available through `<command> --help` or `man <command>`

SOPS simplifies handling and sharing of project scoped secrets.

It works by symmetrically encrypting file content for a set of known recipients.

SOPS provide a set of easy(er) to use commands for working with encrypted content. Eg:

- Encrypting files according to policy
- Decrypting files according to policy
- Rotating keys
- Updating recipient that are allowed to decrypt the content

### Usage

1. Decrypt the content locally and use that for commands that need priviliges

    ```sh
    sops decrypt secrets.yaml > secrets_unencrypted.yaml
    ```

2. Do Just-In-Time decryption by wrapping the command that needs the secret

    ```sh
    sops exec-env secrets.yaml "terraform -chdir=infrastructure apply"
    ```

## Age

Age is just a tool for simply generating a public-private key pair. There's a plethora of options here, this is just a modern simple alternative supported by SOPS.

You can review the SOPS documentation for a full list. Age is just recommended to start you off.

## References

- [SOPS](https://github.com/getsops/sops)
- [Age](https://github.com/FiloSottile/age)
