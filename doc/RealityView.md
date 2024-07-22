
## Concepts

What is `Entity`? 

Explained in the source code.

```swift
/// An element of a RealityKit scene to which you attach components that provide
/// appearance and behavior characteristics for the entity.
///
/// You create and configure entities to embody objects that you want to place
/// in the real world in an AR app. You do this by adding ``Entity`` instances
/// to the ``Scene`` instance associated with an ``ARView``.
///
/// RealityKit defines a few concrete subclasses of ``Entity`` that provide
/// commonly used functionality. 
/// For example, you typically start by creating an instance of ``AnchorEntity``
/// to anchor your content, and add the anchor to a
/// scene’s ``Scene/anchors`` collection. You might then instantiate a
/// ``ModelEntity`` to represent a physical object in the scene, and add that as
/// a child entity to the anchor. You can also create custom entities, and add
/// them either to an anchor, or as children of another entity.
///
/// ![Block diagram showing how entity hierarchies, composed of different kinds
/// of entities, attach to a scene, which is itself a child of the AR
/// view.](Entity-1)
///
/// You can load predefined entities or a hierarchy of entities from your app’s
/// bundle, or from a file on disk, using the methods in <doc:stored-entities>.
/// Alternatively, you can create entities programmatically.
///
/// Entities contain components (instances conforming to the ``Component``
/// protocol) that provide appearance and behaviors for the entity. For example,
/// the ``Transform`` component contains the scale, rotation, and translation
/// information needed to position an entity in space. You store components in
/// the entity’s ``Entity/components`` collection, which can hold exactly one of
/// any component type. It makes sense to have only a single ``Transform``
/// component, one ``ModelComponent`` (specifying the visual appearance of the
/// entity), and so on.
///
/// ![Diagram showing the components present in the base entity class, as well
/// as in the derived anchor entity and model entity classes.](Entity-2)
///
/// All entities inherit a few common components from the ``Entity`` base class:
/// the ``Transform`` component for spatial positioning, and
/// ``SynchronizationComponent``, which enables synchronization of the entity
/// among networked peers. Specific types of entities define additional
/// behaviors. For example, the model entity has components for visual
/// appearance (``ModelComponent``), collision detection
/// (``CollisionComponent``), and physics simulations (``PhysicsBodyComponent``
/// and ``PhysicsMotionComponent``).
```
