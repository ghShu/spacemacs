
# Table of Contents

1.  [SpacEmacs private layers](#org9a9060c)
2.  [Installation](#orgdf6fae6)
3.  [Further reading](#org32c8af1)


<a id="org9a9060c"></a>

# SpacEmacs private layers

This repository stores my private configuration layers.


<a id="orgdf6fae6"></a>

# Installation

    cd .emacs.d
    git clone https://github.com/ghShu/spacemacs-private.git private

After that add layer `guanghua` into the

    (defun dotspacemacs/layers()
      (setq-default dotspacemacs-configuration-layers
        '(guanghua)
      )
    )

Once the configuration is done, restart Emacs to load, install and configure
your layer.


<a id="org32c8af1"></a>

# Further reading

[Spacemacs doc: conf<sub>layers</sub>](https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#extensions-and-packages)

