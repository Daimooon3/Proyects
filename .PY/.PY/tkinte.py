import tkinter as tk

root = tk.Tk()

root.title("Primeros pasos")
root.geometry("640x480")
root.minsize(320, 240)
root.maxsize(1280, 700)
etiqueta = tk.Label(root, text="Primeros pasos con Python interfaz grafica")
etiqueta.pack()

def mostrar_texto():
    texto = entrada.get()
    etiqueta.config(text=texto)

etiqueta = tk.Label(root, text="Escribe algo")
etiqueta.pack()

entrada = tk.Entry(root)
entrada.pack()

boton = tk.Button(root, text="Visualizar Texto", command=mostrar_texto)
boton.pack()


root.mainloop()