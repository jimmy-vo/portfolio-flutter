### Machine Learning moving toward the edge devices
Traditional Internet of Things (IoT) infrastructures have two main parts: the `edge` and the `cloud`. The `edge` is the part of the system that is closest to sensors or the source of data. The `edge` actively works to sense, store, and send that data to the cloud. The `cloud`, on the other hand, is a huge centralized infrastructure and resides far away from where all the data is stored and analyzed.

Traditionally, data would be collected and sent to the cloud for analytics, the results from the analytics would then be sent to the edge, where a user would read the analysis or a machine would perform certain actions. However, this leads to the latency of sending data back and forth between the cloud and edge.

In recent years, researchers have been trying to run a machine learning model on the edge devices. They introduce the technology called `quantization`

### Quantization
Thanks to my past Embedded System background, getting into Quantization in Machine Learning was quite an easy path to me. `Quantization` is a basic concept in digital signal processing. It is the process of mapping continuous infinite values to a smaller set of discrete finite values. In the context of simulation and embedded computing, it is about approximating real-world values with a digital representation that introduces limits on the precision and range of value.

<div>
<img src="assets/db/img/blogs/LifeElevated_03.png" class="blog-image" />
</div>
<br/>

Below is the illustrations of the quantizing a ReLu:
<div>
<img src="assets/db/img/blogs/LifeElevated_04.jpg" class="blog-image" />
</div>
<br/>

As you can see on the left-hand side is the original ReLu activation layer. On the right-hand side are the steps needed to quantize that ReLu. The whole idea is to convert the 32-bit floating-point input into an 8-bit value (0 to 255). Then we can feed it to the ReLu function.

The same idea can be applied to the whole Neural Network We also know that nodes in a Neural Network are nothing but just `weights`, `biases`. They need to be quantized as well to be able to produce 8-bit output.

You may wonder quantizing thousands or millions of nodes in a Neural Network may require a lot of work. Fortunately, TensorFlow automates most of the things to make our job easier. However, it is not that simple to make your machine learning model works on embedded devices. You may found a lot of problems:
* reduction accuracy
* incompatible when converting your model
* True Zero problem
* Dequantize the values properly
* Some times you need to retrain the whole model to have it quantized properly

But no worry, google around I am sure that you will figure it out. Below are the key points I found useful when I work with quantization personally. I hope it will save time:
* In the TensorFlow world, there are two types of quantization: `Post-training quantization` and `Quantization-aware training`. Depending on the precision, there are sub-categories but those are the main techniques. `Post-training quantization` is something simple like a conversion from 32-bit float to 8-bit integer, while `Quantization-aware training` requires more work like pre-process data. Whatever technique you use, in the end, you will have a `lite model`, which is optimized for embedded devices. That model only works with an 8-bit integer, so you need to scale the input and output properly.
* As mentioned above, the `lite model` is optimized for embedded devices in general. However, if you want to run your model on a physical TPU, you have to take a further step to convert your `lite model` into the `TPU model`. For those who don't know about TPU, it is a specified device that performs faster than a GPU. I can look up a number, but from what I remember, my model trained 7 times faster on a TPU, compare to a GPU on my machine. Another thing to keep in mind that TPU can only process a converted model. All the re-processing has to be done somewhere else before you feed the input to the TPU. You may think you can add a fake layer in your model, retrain, and convert the model again. I tried that, and it is not an option, because not all kinds of layers are supported (in my time). Hopefully, they will support that in the future.
