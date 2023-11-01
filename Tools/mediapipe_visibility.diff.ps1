# 要比较的文件
$files = @(
    "mediapipe/calculators/audio/BUILD"
    "mediapipe/calculators/core/BUILD"
    "mediapipe/calculators/image/BUILD"
    "mediapipe/calculators/tensor/BUILD"
    "mediapipe/calculators/tflite/BUILD"
    "mediapipe/calculators/util/BUILD"
    "mediapipe/calculators/video/BUILD"
    "mediapipe/framework/BUILD"
    "mediapipe/framework/formats/BUILD"
    "mediapipe/framework/formats/annotation/BUILD"
    "mediapipe/framework/formats/motion/BUILD"
    "mediapipe/framework/formats/object_detection/BUILD"
    "mediapipe/gpu/BUILD"
    "mediapipe/graphs/instant_motion_tracking/calculators/BUILD"
    "mediapipe/graphs/iris_tracking/calculators/BUILD"
    "mediapipe/graphs/object_detection_3d/calculators/BUILD"
    "mediapipe/java/com/google/mediapipe/components/BUILD"
    "mediapipe/java/com/google/mediapipe/framework/BUILD"
    "mediapipe/java/com/google/mediapipe/glutil/BUILD"
    "mediapipe/modules/face_detection/BUILD"
    "mediapipe/modules/face_geometry/BUILD"
    "mediapipe/modules/face_geometry/protos/BUILD"
    "mediapipe/modules/holistic_landmark/calculators/BUILD"
    "mediapipe/modules/objectron/calculators/BUILD"
    "mediapipe/tasks/cc/components/containers/proto/BUILD"
    "mediapipe/tasks/cc/core/BUILD"
    "mediapipe/tasks/cc/core/proto/BUILD"
    "mediapipe/tasks/cc/vision/face_detector/proto/BUILD"
    "mediapipe/tasks/cc/vision/face_geometry/calculators/BUILD"
    "mediapipe/tasks/cc/vision/face_geometry/proto/BUILD"
    "mediapipe/tasks/cc/vision/face_landmarker/proto/BUILD"
    "mediapipe/tasks/cc/vision/hand_detector/proto/BUILD"
    "mediapipe/tasks/cc/vision/hand_landmarker/proto/BUILD"
    "mediapipe/tasks/cc/vision/pose_detector/proto/BUILD"
    "mediapipe/tasks/cc/vision/pose_landmarker/proto/BUILD"
    "mediapipe/util/BUILD"
    "mediapipe/util/tracking/BUILD"
)

# 清空输出文件
if (Test-Path mediapipe_visibility.diff) { Remove-Item mediapipe_visibility.diff }

# 创建一个使用UTF-8编码（无BOM）和LF行尾的StreamWriter
$utf8NoBom = New-Object System.Text.UTF8Encoding $false
$sw = New-Object System.IO.StreamWriter('mediapipe_visibility.diff', $false, $utf8NoBom)
$sw.NewLine = "`n"

# 对每个文件进行对比并将结果添加到输出文件中
foreach ($file in $files) {
        git diff --no-index "E:/Downloads/mediapipe-0.10.7/mediapipe-0.10.7/${file}" "E:/Downloads/mediapipe-0.10.1/mediapipe-0.10.1/${file}" | ForEach-Object {
        $sw.WriteLine($_)
    }
}

# 关闭StreamWriter
$sw.Close()