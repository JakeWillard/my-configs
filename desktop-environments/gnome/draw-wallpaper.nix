{ pkgs, colors }: pkgs.writers.writePython3Bin "draw-wallpaper" { 

  libraries = with pkgs.python312Packages; [ 
    matplotlib 
    numpy
  ];

  flakeIgnore = [ "E231" "E501" "W293" "E303" "E226" ]; 
} '' 

from matplotlib import pyplot as plt
import numpy as np


def generate_colors():

    colors = ['${colors.base00}']
    colors.append('${colors.base01}')
    colors.append('${colors.base02}')
    colors.append('${colors.base03}')
    colors.append('${colors.base04}')
    colors.append('${colors.base05}')
    colors.append('${colors.base06}')
    colors.append('${colors.base07}')
    colors.append('${colors.base08}')
    colors.append('${colors.base09}')
    colors.append('${colors.base0A}')
    colors.append('${colors.base0B}')
    colors.append('${colors.base0C}')
    colors.append('${colors.base0D}')
    colors.append('${colors.base0E}')
    colors.append('${colors.base0F}')

    background = colors[1]
    accents = np.random.choice(colors, 3)

    return background, accents
    




def generate_image(ax, accents):

    sample_thetas = np.unique(np.sort(np.random.rand(10)*2*np.pi))
    N = len(sample_thetas)
    even_thetas = np.linspace(0, np.pi, N+1)[0:N]

    b = np.sin(even_thetas)
    M = np.zeros((N, N))
    for i in range(0, N):
        for j in range(0, N):
            M[i,j] = np.sin((j+1)*sample_thetas[i])
    
    Cs = np.dot(np.linalg.inv(M), b)

    Ng = 150
    x = np.linspace(-0.5, 0.5, Ng)
    y = np.linspace(-0.5, 0.5, Ng)
    X, Y = np.meshgrid(x, y)
    
    z = np.zeros((Ng, Ng))
    for i in range(0, Ng):
        for j in range(0, Ng):
            r = np.sqrt(x[i]**2 + y[j]**2)
            t = np.arctan2(y[j], x[i])
            z[i,j] = np.sum([Cs[n]*np.sin((n+1)*t)*r**n for n in range(0, N)])

    zmax = np.max(z)
    zmin = np.min(z)
    z[:,:] = (z[:,:] - zmin) / (zmax - zmin)
    z[:,:] += np.random.rand()*X + np.random.rand()*Y + np.random.rand()*np.multiply(X, Y)

    Nls = 50
    vals_1 = np.sort(np.random.rand(Nls))
    vals_2 = np.sort(np.random.rand(Nls))
    vals_3 = np.sort(np.random.rand(Nls))

    w1 = np.random.rand(Nls) * 0.5
    w2 = np.random.rand(Nls) * 0.5
    w3 = np.random.rand(Nls) * 0.5

    ax.contour(X, Y, z, levels=vals_1, colors=accents[0], linewidths=w1)
    ax.contour(X, Y, z, levels=vals_2, colors=accents[1], linewidths=w2)
    ax.contour(X, Y, z, levels=vals_3, colors=accents[2], linewidths=w3)
    
    ax.axis('off')



def make_plot(path):

    background, accents = generate_colors()

    fig, ax = plt.subplots(figsize=(19.20, 10.80))
    generate_image(ax, accents)
    fig.tight_layout(pad=0)
    fig.patch.set_facecolor(background)
    fig.savefig(path)



if __name__ == '__main__':

    make_plot("/home/jake/.wallpaper.png")
''