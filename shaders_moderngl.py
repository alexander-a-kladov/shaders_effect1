#!/usr/bin/python3

import moderngl_window as mglw

class App(mglw.WindowConfig):
 window_size = 1024, 768
 resource_dir = 'shaders'
 
 def __init__(self, **kwargs):
  super().__init__(**kwargs)
  self.quad = mglw.geometry.quad_fs()
  self.prog = self.load_program(vertex_shader='vertex_shader.glsl',
                                fragment_shader='fragment_shader.glsl')
  self.set_uniform('resolution', self.window_size)
  
 def set_uniform(self, u_name, u_value):
  try:
   self.prog[u_name] = u_value
  except KeyError:
   print(f'uniform: {u_name} - not used in shader')
 
 def render(self, time, frame_time):
  self.ctx.clear()
  self.set_uniform('time', time)
  self.quad.render(self.prog)

  
if __name__ == '__main__':
 mglw.run_window_config(App)

