import tkinter as tk
from tkinter import messagebox
import subprocess

root = tk.Tk()
root.title("God Launcher")
root.geometry("640x480")
root.maxsize(1280, 700)
root.minsize(100, 100)

def abrir_programa():
    ruta = entrada.get()
    try:
        subprocess.Popen([ruta])
    except FileNotFoundError:
        messagebox.showerror("Error", "No se encontró el archivo.")
    except Exception as e:
        messagebox.showerror("Error", f"Ocurrió un error al intentar abrir el archivo: {e}")    

etiqueta = tk.Label(root, text="Ingrese la ruta del programa:")
etiqueta.pack(pady=5)

entrada = tk.Entry(root, width=50)
entrada.pack(pady=5)

boton = tk.Button(root, text="Abrir Programa", command=abrir_programa)
boton.pack(pady=5)


root.mainloop()